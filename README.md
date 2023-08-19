# Web Page Fetching Script

A command-line script to fetch web pages, save content locally, and display metadata.

## Running with Docker

1. **Clone the Repository**: Clone this repository to your local machine using `git clone`.

2. **Navigate to the Directory**: Open a terminal and navigate to the directory where you cloned the repository.

3. **Modify docker-compose.yml (if needed):**:  Replace URLs with the ones you want to fetch. To do replace, 
   Go to `docker-compose.yml` `https://www.google.com` and `https://www.autify.com`. To add additional URLs, follow the format and add them to the list or array of URLs:
   `command: ["ruby", "main.rb", "https://www.google.com", "https://www.autify.com", "https://www.additionalurl.com"]``

4. **Run Docker Compose**: Execute the following command to run the Docker container using docker-compose:
```
docker-compose up
```
5. **View Output**: The script will fetch web pages, save them to files, and display metadata in the terminal.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the [MIT License](LICENSE).

