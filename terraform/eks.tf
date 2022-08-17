#Create EKS Cluster 

resource "aws_eks_cluster" "final-cluster" {
    name = "final-cluster"
    role_arn = aws_iam_role.eks_master.arn

    vpc_config {
        security_group_ids = [aws_security_group.final-security-group.id]
        subnet_ids = [aws_subnet.final-subnet-1.id, aws_subnet.final-subnet-2.id]
    }

    # Enable EKS Cluster Control Plane Logging
    enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

    #Assign IAM ROLE permission to cluster
    depends_on = [
        aws_iam_role_policy_attachment.master-EKSCluster,
        aws_iam_role_policy_attachment.master-EKSVPCResource
    ]
}

#Create node groups for eks cluster
resource "aws_eks_node_group" "final-nodeGroup"{
    cluster_name = aws_eks_cluster.final-cluster.name
    node_group_name = "eks-node-group"
    node_role_arn = aws_iam_role.eks-nodeGroup.arn
    subnet_ids = [aws_subnet.final-subnet-1.id, aws_subnet.final-subnet-2.id]

    ami_type = "AL2_x86_64"
    capacity_type = "ON_DEMAND"
    disk_size = 20
    instance_types = ["t2.micro"]

    #scaling
    scaling_config {
        desired_size = 3
        min_size = 3
        max_size = 3
       // max_unavailable = 1
    }

    #Assign IAM Role permission to nodes
    depends_on = [
        aws_iam_role_policy_attachment.workernodes-CNI-Policy,
        aws_iam_role_policy_attachment.workernodes-EC2Container,
        aws_iam_role_policy_attachment.workernodes-EKSWorkerNode
    ]
}
