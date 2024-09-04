resource "aws_ecs_cluster" "medusa_cluster" {
  name = "medusa-cluster"
}

resource "aws_ecs_task_definition" "medusa_task" {
  family                   = "medusa-task"
  container_definitions    = jsonencode([
    {
      name      = "medusa-container"
      image     = "pxuanbach/medusa-backend:latest"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        },
      ]
      environment = [
        {
          name  = "NODE_ENV"
          value = "production"
        },
      ]
    }
  ])
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  requires_compatibilities = ["FARGATE"]
  memory                   = "512"
  cpu                      = "256"
  network_mode             = "awsvpc"
}

resource "aws_ecs_service" "medusa_service" {
  name            = "medusa-service"
  cluster         = aws_ecs_cluster.medusa_cluster.id
  task_definition = aws_ecs_task_definition.medusa_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [aws_subnet.medusa_subnet.id]
    security_groups = [aws_security_group.medusa_sg.id]
    assign_public_ip = true  
  }
}
