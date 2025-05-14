import os
from pathlib import Path

from dotenv import load_dotenv

load_dotenv()

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

SQLITE_DB_NAME = os.getenv("SQLITE_DB_NAME")
MONGO_URI = os.getenv("MONGO_URI")
MONGO_DB_NAME = os.getenv("MONGO_DB_NAME")
MONGO_COLLECTION = os.getenv("MONGO_COLLECTION")
DEEPSEEK_API_KEY = os.getenv("DEEPSEEK_API_KEY")

os.environ["OPENAI_API_KEY"] = os.getenv("OPENAI_API_KEY")