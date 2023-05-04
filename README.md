# 요약
- terraform 작업 전 terraformrc (테라폼 설정) 파일 생성<br>
    하드링크를 이용해 디스크 실제 용량을 차지하지 않음
    ```tf
    plugin_cache_dir   = "$HOME/.terraform.d/plugin-cache" 
    disable_checkpoint = true
    ```
    !출처: [Terraform Doc(CLI Configuration File)](https://developer.hashicorp.com/terraform/cli/config/config-file)

- AssumeRole
    - 같은 AWS계정일 때 수임당할 Role의 trust relationship에서 보안주체(Principal)만 명시해주면 된다(수임할 Role에서 수임당할 Role로 향하는 policy는 필수가 아님). 하지만 policy만 확인해도 어떤 역할에 Assume되는지 파악 가능하도록 같은 계정이라도 모두 명시하는 것이 좋다.
    - 다른 AWS계정일 경우 policy와 trust relationshopt두 가지 모두 설정 필요하다.<br>
    (역할을 수임할 계정에 policy설정 + 수임당할 Role의 trust relationship에 허용할 pricipal을 명시)
    - AssumeRole이 성공적으로 수행되면 SessionToken형태의 단기자격증명을 사용해 작업하게 된다

- alias
    ```s
    cat<<EOF >> ~/.zshrc
    alias tf='terraform fmt; terraform'
    alias tfp='terraform fmt; terraform plan'
    alias tfa='terraform fmt; terraform apply'
    alias tfaa='terraform fmt; terraform apply -auto-approve'
    alias tfd='terraform fmt; terraform destroy'
    alias tfda='terraform fmt; terraform destroy -auto-approve'
    ```

- Resource / Data source
    - Resource의 경우 awscli에서 바로 사용할 수 있는 json 형식으로 리소스를 선언할 수 있지만 Terraform에서 검증 기능이 약함(effect: Allowwww 등도 허용됨)
    - Data source의 경우 Terraform에서 제공하는 만큼 데이터 검증이 강화되어있으나, 컨벤션이 AWS와 맞지않고, Data source가 다른 Resource에 적용(attach 등)되지 않으면 실제로 동작하지 않음(iam_policy_document 생성 후 Role이나 User에 attach하지 않으면 iam_policy가 생성되지 않음)

- terraform 변수 종류
    - variables
        - 상수만 입력 가능
        - 표현식이나 함수를 이용해 동적으로 값을 입력할 수 없음
        - var.<변수명> 으로 사용
    - locals
        - 동적인 값을 저장하기 위한 변수
        - local.<변수명> 으로 사용

