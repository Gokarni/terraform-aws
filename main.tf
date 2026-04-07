module "dev-infra" {
    source = "./infra-setup"
    env="dev"
    hashkey = "Gokarni"
    ami="ami-0ecb62995f68bb549"
    volsize = "8"
    voltype = "gp2"
    instancecount = 1
    instancetype = "t2.micro"
}

module "prod-infra" {
    source = "./infra-setup"
    env="prod"
    hashkey = "Gokarni"
    ami="ami-0ecb62995f68bb549"
    volsize = "10"
    voltype = "gp2"
    instancecount = 2
    instancetype = "t2.micro"
}

module "staging-infra" {
    source = "./infra-setup"
    env="staging"
    hashkey = "Gokarni"
    ami="ami-0ecb62995f68bb549"
    volsize = "10"
    voltype = "gp2"
    instancecount = 1
    instancetype = "t2.micro"
}