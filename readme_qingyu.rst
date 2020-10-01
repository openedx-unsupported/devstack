QingYu development configurations
================================

*Link pip to pip3
     sudo ln -s /usr/bin/pip3 /usr/bin/pip

*npm registry setting
    npm config set registry https://artifacthub-tip.oraclecorp.com/api/npm/npmjs-remote

*Language setting
    Config file:/edx/etc/lms.yml 
    
    ```
    LANGUAGE_CODE: zh-hans
    ```
    
* Create orgnization 
insert into organizations_organization (created, modified, name, short_name, active) VALUES (NOW(), NOW(), 'QINGYU', 'qy01', 1);
