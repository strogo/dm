<%page args="post, display='full'"/>

<div class="blog_post ${display} ${'prepend-top' if display == 'full' else 'span-11'} last">

    <a name="${post.slug}"></a>

    <h${'2' if display == 'full' else '3'} class="blog_post_title">
        <a href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">${post.title}</a>
    </h${'2' if display == 'full' else '3'}>

    <strong ${'span-10' if display == 'full' else ''}>${post.date.strftime("%B %d, %Y")}</strong><br/>

    % if display == 'full':
        <small>
        categories:
            <%
            category_links = []
            for category in post.categories:
                if post.draft:
                    category_links.append(category.name)
                else:
                    category_links.append("<a href='%s'>%s</a>" % (category.path, category.name))
            %>

            ${", ".join(category_links)}

            % if bf.config.blog.disqus.enabled:
            | <a href="${post.permalink}#disqus_thread">View Comments</a>
            % endif

        </small>
    % endif

    <div class="post_prose ${display}">
        % if display == 'summary':
            <div class="span-11 last">
            ${post.excerpt}
            </div>
        % else:
            ${post.content}
        % endif
    </div>

</div>
