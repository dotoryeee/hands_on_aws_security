# 요약
- terraform 작업 전 terraformrc (테라폼 설정) 파일 생성<br>
    하드링크를 이용해 디스크 실제 용량을 차지하지 않음
    ```tf
    plugin_cache_dir   = "$HOME/.terraform.d/plugin-cache" 
    disable_checkpoint = true
    ```
    !출처: [Terraform Doc(CLI Configuration File)](https://developer.hashicorp.com/terraform/cli/config/config-file)

- AssumeRole
    - 같은 AWS계정일 때 policy와 trust relationship중 하나만 필요하다. 하지만 policy만 확인해도 어떤 역할에 Assume되는지 파악 가능하도록 같은 계정이라도 모두 명시하는 것이 좋다.
    - 다른 AWS계정일 경우 policy와 trust relationshopt두 가지 모두 설정 필요하다.<br>
    (역할을 수임할 계정에 policy설정 + 수임당할 Role의 trust relationship에 허용할 pricipal을 명시)


