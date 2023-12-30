

import mysql.connector

class DatabaseManager:
    def __init__(self, host, user, password, database):
        self.connection = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            database=database
        )
        self.cursor = self.connection.cursor()

    def execute_sql(self, sql_query):
        try:
            self.cursor.execute(sql_query)
            self.connection.commit()
            print("Query executed successfully.")
        except mysql.connector.Error as err:
            print(f"Error: {err}")

    def execute_script(self, script_file):
        try:
            with open(script_file, 'r') as file:
                sql_script = file.read()
                self.cursor.execute(sql_script, multi=True)
                self.connection.commit()
                print("Script executed successfully.")
        except mysql.connector.Error as err:
            print(f"Error: {err}")

    # Add methods for data entry, update, delete, and browsing as needed

    def close_connection(self):
        self.cursor.close()
        self.connection.close()

def admin_interface(database_manager):
    print("Admin Interface")
    while True:
        print("1. Execute SQL Command")
        print("2. Execute SQL Script")
        print("3. Exit")
        choice = input("Enter your choice: ")

        if choice == '1':
            sql_command = input("Enter SQL command: ")
            database_manager.execute_sql(sql_command)
        elif choice == '2':
            script_file = input("Enter path and file name of the SQL script: ")
            database_manager.execute_script(script_file)
        elif choice == '3':
            break
        else:
            print("Invalid choice. Please try again.")

def data_entry_interface(database_manager):
    # Implement data entry interface based on the requirements
    pass

def browsing_interface(database_manager):
    # Implement browsing interface based on the requirements
    pass

def main():
    host = "your_mysql_host"
    user = "your_mysql_user"
    password = "your_mysql_password"
    database = "your_mysql_database"

    database_manager = DatabaseManager(host, user, password, database)

    while True:
        print("1. Admin Interface")
        print("2. Data Entry Interface")
        print("3. Browsing Interface")
        print("4. Exit")
        choice = input("Enter your choice: ")

        if choice == '1':
            admin_interface(database_manager)
        elif choice == '2':
            data_entry_interface(database_manager)
        elif choice == '3':
            browsing_interface(database_manager)
        elif choice == '4':
            database_manager.close_connection()
            print("Exiting the application.")
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()
