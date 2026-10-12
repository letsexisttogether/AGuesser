import sqlite3
from pathlib import Path
from typing import List, Any, Union

class SQLiteProvider:
    def __init__(self, dbPath: Union[str, Path], appTag: str = 'Install'):
        self.db_path = Path(dbPath)
        self.app_tag = f'[{appTag}.py] '
        self._ensure_data_dir()
        
        self.connection = None
        self.cursor = None

    def _log(self, phrase: str = ""):
        print(f"{self.app_tag}{phrase}")

    def _ensure_data_dir(self):
        if not self.db_path.parent.exists():
            self._log(f'Creating data directory: {self.db_path.parent}')
            self.db_path.parent.mkdir(parents=True, exist_ok=True)

    def __enter__(self):
        self.connect()
        return self

    def __exit__(self, excType, excVal, excTb):
        self.close()

    def connect(self):
        self._log('[DATABASE INIT START]')
        self.connection = sqlite3.connect(self.db_path)
        self.cursor = self.connection.cursor()

    def close(self):
        if self.connection:
            self.connection.commit()
            self.connection.close()
            self._log('\n[DATABASE INIT FINISH]')

    def create_table(self, tableName: str, schemaSql: str):
        self._log(f"TABLE: {tableName}")
        self.cursor.execute(schemaSql)

    def drop_table(self, tableName: str):
        self._log(f'TABLE (DROP): {tableName}')
        self.cursor.execute(f'DROP TABLE IF EXISTS {tableName};')

    def recreate_table(self, tableName: str, schemaSql: str):
        self.drop_table(tableName)
        self.create_table(tableName, schemaSql)

    def insert_into_table(self, tableName: str, columns: List[str], values: List[List[Any]]):
        if not columns:
            raise RuntimeError('[AGSR::Error] Empty columns')
        if not values:
            raise RuntimeError('[AGSR::Error] Empty values')

        # Build parameterized query safely: INSERT INTO Users (Name, Email) VALUES (?, ?)
        colsFormatted = ', '.join(columns)
        placeholders = ', '.join(['?' for _ in columns])
        sql = f'INSERT INTO {tableName} ({colsFormatted}) \
                VALUES ({placeholders})'

        self._log(f'Inserting {len(values)} row(s) into {tableName}')

        self.cursor.executemany(sql, values)


DATA_DIR = Path('Data')
DB_NAME = DATA_DIR / 'AGuesserData.db'


if __name__ == '__main__':
    with SQLiteProvider(DB_NAME, appTag='Install') as db:
        print('[CREATING TABLES]')
        db.recreate_table('Users', '''
            CREATE TABLE Users
            (
                ID INTEGER PRIMARY KEY AUTOINCREMENT,
                Name TEXT NOT NULL,
                Email TEXT NOT NULL
            );
        ''')
        db.recreate_table('Champions', '''
            CREATE TABLE Champions
            (
                ID INTEGER PRIMARY KEY AUTOINCREMENT,
                Name TEXT NOT NULL
            );
        ''')
        db.recreate_table('ChampionTrait', '''
            CREATE TABLE ChampionsTraits
            (
                ID INTEGER PRIMARY KEY AUTOINCREMENT,
                NumberValue INTEGER NOT NULL,
                StringValue TEXT DEFAULT '',
                IsComparable INTEGER NOT NULL DEFAULT 0
            );
        ''')
        db.recreate_table('ChampionTraits', '''
            CREATE TABLE ChampionsTraits
            (
                ID INTEGER PRIMARY KEY AUTOINCREMENT,
                ChampionID INTEGER NOT NULL,
                ElixirID INTEGER NOT NULL,
                RarityID INTEGER NOT NULL,
                TargetsID INTEGER NOT NULL,
                RangeTypeID INTEGER NOT NULL,
                AttackSpeedID INTEGER NOT NULL,
                SpeedID INTEGER NOT NULL,
                ReleaseDateID INTEGER NOT NULL
            );
        ''')

        print('\n[INSERTING DATA]')
        db.insert_into_table(
            tableName='Users',
            columns=['Name', 'Email'],
            values=[
                ['Alex', 'letmeexist95@gmail.com'],
                ['Someone', 'SomeEmail@gmail.com'],
                ['EndRow', 'EndRowEmail@gmail.com']
            ]
        )
        db.insert_into_table(
            tableName='Users',
            columns=['Name', 'Email'],
            values=[
                ['Alex', 'letmeexist95@gmail.com'],
                ['Someone', 'SomeEmail@gmail.com'],
                ['EndRow', 'EndRowEmail@gmail.com']
            ]
        )
