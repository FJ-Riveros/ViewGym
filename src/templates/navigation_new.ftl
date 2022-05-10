<#--
//Allow fixed top on the nabvar when the web is completed
<nav class="navbar navbar-expand-lg fixed-top" id="navigation" role="navigation">
-->
<nav class="navbar navbar-expand-lg" id="navigation" role="navigation">
	<div class="container">
			
		<a class="navbar-brand" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
			<img alt="${logo_description}" height="80px" src="${site_logo}" width="100px" />
		</a>
		<#--
		<#if show_site_name>
			<span class="site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
				${site_name}
			</span>
		</#if>
		-->
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
           	aria-label="Toggle navigation">
           		<span class="navbar-toggler-icon"></span>
        	</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-lg-auto" aria-label="<@liferay.language key="site-pages" />" role="menubar">
				<#list nav_items as nav_item>
					<#assign
						nav_item_attr_has_popup = ""
						nav_item_css_class = ""
						nav_item_layout = nav_item.getLayout()
					/>			<#if nav_item.isSelected()>
						<#assign
							nav_item_attr_has_popup = "aria-haspopup='true'"
							nav_item_css_class = "selected"
						/>
					</#if>			
					<li class="${nav_item_css_class} nav-item" id="layout_${nav_item.getLayoutId()}" role="presentation">
						<a class="nav-link" aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem"><span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span></a>				
						<#if nav_item.hasChildren()>
							<ul class="child-menu" role="menu">
								<#list nav_item.getChildren() as nav_child>
									<#assign
										nav_child_css_class = "nav-item"
									/>							
									<#if nav_item.isSelected()>
										<#assign
											nav_child_css_class = "selected"
										/>
									</#if>							
									<li id="layout_${nav_child.getLayoutId()}" role="presentation">
										<a class="nav-link" aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
									</li>
								</#list>
							</ul>
						</#if>
				</li>
				</#list>
				<#if !is_signed_in>
					<a class="nav-link" data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow"><i class="fa-solid fa-arrow-right-to-bracket"></i></a>
					<#--  <a class="nav-link" data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow"><span>${sign_in_text}</span></a>  -->
				<#else>
					<a class="nav-link" data-redirect="${is_login_redirect_required?string}" href="${sign_out_url}" id="sign-out" rel="nofollow"><i class="fa-solid fa-door-open"></i></a>
					<#--  <a class="nav-link" data-redirect="${is_login_redirect_required?string}" href="${sign_out_url}" id="sign-out" rel="nofollow"><span>${sign_out_text}</span></a>  -->
				</#if>

				<@liferay.user_personal_bar />
			</ul>
		</div>
	</div>
</nav>