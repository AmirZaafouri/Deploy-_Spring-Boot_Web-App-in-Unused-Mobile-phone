# Deploying Spring Boot + MySQL on Android phone Unused phone

This guide explains how to set up and deploy a Spring Boot application with MySQL on an Ubuntu environment running inside UserLAnd on an Android device.

## Prerequisites

- Android device with [UserLAnd](https://play.google.com/store/apps/details?id=tech.ula) installed.
- Basic knowledge of Linux commands.
- A Spring Boot application with a Maven build structure.

---

## 1. Install Required Packages

Update and install the necessary packages:
In my case, I have created a Spring Boot application with Java 8 structure using Maven and MySQL(database).

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install openjdk-8-jdk maven mysql-server -y
```

Verify Java installation:

```bash
java -version
```

If needed, configure Java manually:

```bash
sudo update-alternatives --config java
```

---

## 2. Set Up MySQL

UserLAnd does not support MySQL as a service, so it must be started manually:

```bash
sudo mysqld_safe --skip-networking &
```

Secure MySQL installation:

```bash
sudo mysql_secure_installation
```

Create a database and user for the Spring Boot application:
in my case my data base configured with name stationSki on proroprete file
```sql
CREATE DATABASE stationSki;
CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'TypeYourpassword';
GRANT ALL PRIVILEGES ON mydb.* TO 'myuser'@'localhost';
FLUSH PRIVILEGES;
```

Exit MySQL:

```bash
exit
```

---

## 3. Deploy Spring Boot Application

Clone or upload your Spring Boot project inside UserLAnd:

```bash
git clone https://github.com/your-repo.git
cd your-repo
```

Build the project:

```bash
mvn clean package
```

Run the application:
by using * it's automticly take anything end with extenstion .jar => livrable
```bash
java -jar target/*.jar
```

---

## 4. Access the Application

Find your local IP address:

```bash
ip a | grep inet
```

Access the application from any device connect to the same Network with browser:

```
http://@IP_phone:8080
```

If needed, check running processes and ports:

```bash
netstat -tulnp
```

---

## Troubleshooting

- **MySQL not starting?** Try:
  ```bash
  sudo mysqld_safe --skip-grant-tables &
  ```
- **Port conflicts?** Check active ports:
  ```bash
  netstat -tulnp
  ```
- **Application not accessible?** Consider using SSH tunneling or a reverse proxy.

---

## Conclusion

You have successfully deployed a Spring Boot + MySQL application on UserLAnd Ubuntu. 🎉 If you have any issues or improvements, feel free to contribute or raise an issue in this repository!

🚀 Happy Coding!

