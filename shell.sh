
function status_check() {
    if [ $? -eq 0 ]; then
        echo -e "\e[32mSUCCESS\e[0m"
        else
        echo -e "\e[31mFAILURE\e[0m"
    fi
}

echo "Ins"


aws ec2 describe-instances \
    --region us-east-1 \
    --query 'Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name,Tags[?Key==`Name`].Value|[0],PrivateIpAddress,PublicIpAddress]' \
    --output table


