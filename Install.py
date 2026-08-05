import sqlite3
from pathlib import Path

DATA_DIR = Path('Data')
DB_NAME = DATA_DIR / 'AGuesserData.db'

def PrintProgramName(phrase: str):
    programName = '[Install.py] '

    finalPhrase = programName + phrase
    print(finalPhrase)

def CreateTables(cursor):
    PrintProgramName('Creating tables')

    PrintProgramName('TABLE: Users')
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS Users
        (
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            Name TEXT NOT NULL,
            Email TEXT NOT NULL
        ) 
    """)

def DeleteData(cursor):
    pass

def InsertData(cursor):
    pass


if __name__ == '__main__':
    if not DATA_DIR.exists():
        PrintProgramName('Creating data directory')
        DATA_DIR.mkdir()

    connection = sqlite3.connect(DB_NAME)
    cursor = connection.cursor()

    PrintProgramName('Database init start')

    CreateTables(cursor)
    DeleteData(cursor)
    InsertData(cursor)

    connection.commit()
    connection.close()

    PrintProgramName('Database init finish')
