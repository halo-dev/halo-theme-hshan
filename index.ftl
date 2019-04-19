<h1>文章列表</h1>
<ul>
    <#list posts.content as post>
        <li>
            <a href="/archives/${post.url}">${post.title}</a>
        </li>
    </#list>
</ul>
