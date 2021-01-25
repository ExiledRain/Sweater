<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>

    <div>
        <@l.logout />
        <span><a href="/user">User list</a></span>
    </div>

    <div>
        <form method="post" action="/main">
            <input type="text" name="text" placeholder="EnterMessage" />
            <input type="text" name="tag" placeholder="Tag"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Add</button>
        </form>
    </div>

<div>Messages List</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter?ifExists}"/>
        <button type="submit">Search</button>
    </form>
<#list messages as message>
    <div>
    <b>${message.id}</b>
    <span>${message.text}</span>
    <i>${message.tag}</i>
        <Strong>${message.authorName}</Strong>
    </div>
    <#else >
    No messages
</#list>
</@c.page>