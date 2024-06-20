## Overview

This guide provides a series of Docker commands to manage and interact with a web application's files and permissions within Docker containers. These commands involve copying files, changing ownership and permissions, and viewing file contents.

## Prerequisites

- Docker and Docker Compose installed on your machine.
- A running Docker Compose environment with at least the following services:
  - `datobakeryshop-php-1`
  - `datobakeryshop-nginx-1`

## Commands Explanation

1. **Copy local files to the Docker container**

   ```sh
   docker cp . datobakeryshop-php-1:/var/www/html
   ```

   This command copies all files from the current local directory to the `/var/www/html` directory inside the `datobakeryshop-php-1` container.

2. **Change ownership of the files**

   ```sh
   docker exec datobakeryshop-php-1 chown -R www-data:www-data /var/www/html/
   ```

   This command changes the ownership of all files in `/var/www/html` inside the `datobakeryshop-php-1` container to `www-data` user and group.

3. **List files in the directory**

   ```sh
   docker exec datobakeryshop-nginx-1 ls -la /var/www/html
   ```

   This command lists all files and directories with detailed information in `/var/www/html` inside the `datobakeryshop-nginx-1` container.

4. **Change directory permissions to executable**

   ```sh
   docker exec datobakeryshop-nginx-1 chmod +x /var/www/html/
   ```

   This command makes the `/var/www/html/` directory executable in the `datobakeryshop-nginx-1` container.

5. **View the contents of a file as www-data user**

   ```sh
   docker exec --user www-data datobakeryshop-nginx-1 cat /var/www/html/home.php
   ```

   This command displays the contents of `home.php` in `/var/www/html` as the `www-data` user in the `datobakeryshop-nginx-1` container.

6. **Change file permissions**

   ```sh
   docker exec datobakeryshop-nginx-1 chmod 0740 -R /var/www/html/
   ```

   - Change permissions to `777` recursively:

     ```sh
     docker exec datobakeryshop-nginx-1 chmod 777 -R /var/www/html/
     ```

     This command changes the permissions of all files and directories in `/var/www/html/` to `777` recursively in the `datobakeryshop-nginx-1` container.

7. **Start Docker Compose services**

   ```sh
   docker compose up
   ```

   This command starts all services defined in your `docker-compose.yml` file.

## Conclusion

These commands help you manage and interact with your application's files within Docker containers, ensuring proper file copying, ownership, permissions, and service management.
