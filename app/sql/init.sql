CREATE USER test_aiti_guru_user WITH PASSWORD '100';
CREATE DATABASE test_aiti_guru_db OWNER test_aiti_guru_user;
GRANT ALL PRIVILEGES ON DATABASE test_aiti_guru_db TO test_aiti_guru_user;