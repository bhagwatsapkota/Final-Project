# Create IAM Role for eks Master
resource "aws_iam_role" "eks_master" {
    name = "eks_master"

    assume_role_policy = <<POLICY
{
        "Version": "2012-10-17",
        "Statement":[
        {
            "Action": [
                "sts:AssumeRole",
                "iam:createRole"
            ],
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com"
            }
        }]
    }
    POLICY
}

#Associate IAM Policies to IAM Role (Master)
resource "aws_iam_role_policy_attachment" "master-EKSCluster" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role = aws_iam_role.eks_master.name
}

resource "aws_iam_role_policy_attachment" "master-EKSVPCResource" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
    role = aws_iam_role.eks_master.name
}


#Create IAM Role for esk cluster node groups
resource "aws_iam_role" "eks-nodeGroup"{
    name = "eks-workerNodes"

    assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "sts:AssumeRole",
                "iam:createRole"
            ],
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            }
        }
    ]
}
POLICY
}

#Ass IAM policies to IAM Role (node group)
resource "aws_iam_role_policy_attachment" "workernodes-CNI-Policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role = aws_iam_role.eks-nodeGroup.name
}

resource "aws_iam_role_policy_attachment" "workernodes-EC2Container" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role = aws_iam_role.eks-nodeGroup.name
}

resource "aws_iam_role_policy_attachment" "workernodes-EKSWorkerNode" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role = aws_iam_role.eks-nodeGroup.name
}