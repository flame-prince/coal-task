output "alb_dns_name" {
  value       = aws_lb.alb.dns_name
  description = "DNS name for the Application Load Balancer"
}
