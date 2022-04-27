<#--
//Allow fixed top on the nabvar when the web is completed
<nav class="navbar navbar-expand-lg fixed-top" id="navigation" role="navigation">
-->
<nav class="navbar navbar-expand-lg" id="navigation" role="navigation">
	<div class="row w-100">
		<div class="col-2" aria-level="1" class="site-title" role="heading">
			<a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
				<#--
				<img alt="${logo_description}" height="${site_logo_height}" src="${site_logo}" width="${site_logo_width}" />
				-->
				<img alt="${logo_description}" height="80px" src="${site_logo}" width="100px" />
			</a>
			<#--
			<#if show_site_name>
				<span class="site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
					${site_name}
				</span>
			</#if>
			-->
		</div>
		<div class="col-10 d-flex align-items-center justify-content-end">
			<ul class="d-flex flex-row justify-content-around align-center" aria-label="<@liferay.language key="site-pages" />" role="menubar">
				<#-- </div> -->
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

					</#if>			<li class="${nav_item_css_class} nav-item" id="layout_${nav_item.getLayoutId()}" role="presentation">


						<a class="nav-link" aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem"><span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span></a>				<#if nav_item.hasChildren()>

							<ul class="child-menu" role="menu">
								<#list nav_item.getChildren() as nav_child>
									<#assign
										nav_child_css_class = "nav-item"

									/>							
									
									<#if nav_item.isSelected()>

										<#assign
											nav_child_css_class = "selected"
										/>

									</#if>							<li id="layout_${nav_child.getLayoutId()}" role="presentation">

										<a class="nav-link" aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
									</li>
									<#--
									<li class="${nav_child_css_class} nav-item" id="layout_${nav_child.getLayoutId()}" role="presentation">
										<a aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
									</li>
									-->
								</#list>
							</ul>
						</#if>
				</li>
				</#list>
				<#if !is_signed_in>
					<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
				<#else>
					<a data-redirect="${is_login_redirect_required?string}" href="${sign_out_url}" id="sign-out" rel="nofollow">${sign_out_text}</a>
				</#if>
			</ul>
		</div>
	</div>
</nav>