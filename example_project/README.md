# Example Cairo Project

This is an example Cairo project to demonstrate the usage of the StarkNet development container.

## Running the Project

1. Open the project in VS Code.
2. Open a terminal in the container.
3. Run the following command to compile the Cairo program:

    ```sh
    cairo-compile main.cairo --output main.json
    ```

4. Run the following command to execute the Cairo program:

    ```sh
    cairo-run --program=main.json --print_output --layout=small
    ```

You should see the output of the program, which is the result of adding 5 and 7.
