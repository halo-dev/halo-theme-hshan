<#import "/common/macro/common_macro.ftl" as common>
<#macro layout title,keywords,description>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="${keywords!}"/>
    <meta name="description" content="${description!}" />

    <@common.globalHeader />

    <title>${title}</title>
</head>
<body>
<#include "menu.ftl">

<#nested >

</body>
</html>
</#macro>

