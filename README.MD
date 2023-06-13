# Project Overview:
![project image](project.png)

This [project](http://ec2-13-215-209-48.ap-southeast-1.compute.amazonaws.com/) serves as a foundation for developing commonly used and scalable products in real-world scenarios. It consists of a front-end service and three back-end services.

## Services

- [UI](https://github.com/twinva1/application-web)

- [User service](https://github.com/twinva1/application-web): Enables user creation, login, and retrieval of account information, utilizing the `CrudRepository` interface available in Spring Boot.

- [Expense service](https://github.com/twinva1/expense-service):    
   1. Retrieves a list of expenses based on the provided query conditions, page number, and page size. using the Specification class from the `Spring Data JPA`.[Swagger-API](http://ec2-13-215-209-48.ap-southeast-1.compute.amazonaws.com/expense/swagger-ui/#/Expense)
   2. Expense application submission by users, with the ability to send MQ messages to the `approver-queue`.
   3. Approval or rejection of expense applications by the approver, with corresponding MQ messages sent to the `applier-queue` upon update.
   
- [Notification service](https://github.com/twinva1/notification-service): 
  1. Catching MQ messages and triggering the sending of email notifications upon receiving messages from the `approver-queue`.
  2. Utilizing a CamelRouter to process emails when receiving messages from the `applier-queue`.
  
- Load Balancer:
  [nginx.conf](https://github.com/twinva1/application-web/blob/master/nginx.conf)

## Environment

- Amazon EC2 (ubuntu)
- Amazon RDS (Postgres)
- Amazon MQ (ActiveMQ)


## CI/CD
![CI/CD image](CI%3ACD.png "A CI/CD image")

[Jenkinsfile](Jenkinsfile)      
[docker-compose.yml]
