import sqlite3
from pathlib import Path
from typing import List, Any, Union

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
    
    def execute_sql_file(self, filePath: Union[str, Path]):
        scriptPath = Path(filePath)
        if not scriptPath.exists():
            raise FileNotFoundError(f'[AGSR::Error] SQL file not found: {scriptPath}')

        self._log(f'Executing SQL file: {scriptPath.name}')
        sqlContent = scriptPath.read_text(encoding='utf-8')
        self.cursor.executescript(sqlContent)


SCRIPT_DIR = Path(__file__).resolve().parent
ROOT_DIR = SCRIPT_DIR.parent

DATA_DIR = ROOT_DIR / 'Data'
DB_NAME = DATA_DIR / 'AGuesserData.db'

INSTALL_DIR = SCRIPT_DIR
ROYAL_INSTALL_DIR = INSTALL_DIR / 'Royal'


if __name__ == '__main__':
    with SQLiteProvider(DB_NAME, appTag='Install') as db:
        db.execute_sql_file(ROYAL_INSTALL_DIR / 'CreateTable.sql')
        db.execute_sql_file(ROYAL_INSTALL_DIR / 'InsertData.sql')
