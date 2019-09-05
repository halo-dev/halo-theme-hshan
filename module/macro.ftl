<#macro layout title,keywords,description>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="${keywords!}"/>
    <meta name="description" content="${description!}" />

    <#--
        公共 head 代码，详情请参考：https://halo.run/develop/theme.html#%E5%85%AC%E5%85%B1-head-%E6%A0%87%E7%AD%BE
        包含：Favicon，站点验证代码
    -->

    <@global.head />

    <title>${title}</title>
</head>
<body>
<#include "menu.ftl">

<#nested >

<#--
    公共底部代码，详情请参考：https://halo.run/develop/theme.html#%E5%85%AC%E5%85%B1%E5%BA%95%E9%83%A8
    包含：统计代码，底部信息
-->
<@global.footer />
</body>
</html>
</#macro>

