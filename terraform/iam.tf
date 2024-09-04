resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "ecs_task_execution_policy" {
  name       = "ecsTaskExecutionPolicy"
  roles      = [aws_iam_role.ecs_task_execution_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_policy" "medusa_policy" {
  name        = "medusa-policy"
  description = "Policy for Medusa"

  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "logs:CreateLogGroup"
        Effect    = "Allow"
        Resource  = "*"
      },
      {
        Action    = "logs:CreateLogStream"
        Effect    = "Allow"
        Resource  = "*"
      },
      {
        Action    = "logs:PutLogEvents"
        Effect    = "Allow"
        Resource  = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "medusa_attach" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = aws_iam_policy.medusa_policy.arn
}
