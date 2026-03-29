# Frappe Docker Environment Instructions

## Accessing the Container
- This project is managed by Frappe Manager. The core application runs inside a Docker container.
- The main Frappe container name always follows this pattern: `fm__<site_name>__frappe`.
- **Identify the container first:** Run `docker ps --format '{{.Names}}' | grep -E 'fm__.*__frappe'` to get the exact name for the current active site.

## Execution Rules (CRITICAL)
- All `bench` commands MUST be executed as the user `frappe` and inside the `/workspace/frappe-bench` directory. 
- NEVER run bench commands as `root` or outside the bench folder.

- **Interactive Shell:** If you need to enter the CLI to run multiple commands, use:
  `docker exec -u frappe -w /workspace/frappe-bench -it <container_name> /bin/bash`

- **Single Commands:** If you need to run a single command (like `bench migrate`), execute it directly like this:
  `docker exec -u frappe -w /workspace/frappe-bench <container_name> bench <command>`

## Web Dashboard Access (Chrome DevTools MCP)
- You have access to the Chrome DevTools MCP to interact with the local web UI.
- The project URL dynamically matches the site name: `http://<site_name>.localhost`.
- **To log in to the admin dashboard:**
  1. Use the Chrome DevTools tool to navigate to `http://<site_name>.localhost/login`.
  2. The default username is `Administrator`. 
  3. The default password is usually `admin` or `Admin12@`. If that fails, stop and ask the user.
  4. Fill in the login form fields and submit to enter the Frappe Desk.
- Once logged in, use the browser tools to verify UI changes, create/inspect DocTypes, or debug browser console errors.
