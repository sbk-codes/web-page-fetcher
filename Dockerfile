# Use the official Ruby image as the base
FROM ruby:3.2.2

# Set the working directory inside the container
WORKDIR /app

# Install required gems
RUN gem install nokogiri

# Copy the application files into the container
COPY . /app

# Run the script when the container starts
CMD ["ruby", "main.rb"]
