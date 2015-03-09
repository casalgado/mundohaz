
Deface::Override.new(:virtual_path  => "spree/shared/_main_nav_bar",
                     :remove        => "li#home-link",
                     :name          => "remove-home-link")

Deface::Override.new(:virtual_path  => "spree/shared/_nav_bar",
                     :insert_before  => "li#login-links",
                     :text          => "
										 <li id='link-to-cart' data-hook>
							        <noscript>
							          <%= link_to Spree.t(:cart), '/cart' %>
							        </noscript>
							        &nbsp;
							      </li>
							      <script>Spree.fetch_cart()</script>",
                     :name          => "insert-cart")

Deface::Override.new(:virtual_path  => "spree/shared/_nav_bar",
                     :surround      => "li#search-bar",
                     :text          => "
										 <li> <div class='dropdown'>
										  <button class='btn btn-default dropdown-toggle' type='button' id='dropdownMenu2' data-toggle='dropdown' aria-expanded='true'>
										    <span class='glyphicon glyphicon-search' aria-hidden='true'></span>
										    <span class='caret'></span>
										  </button>
										  <ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu2'>
										    <%= render_original %>
										  </ul>
										</div></li>",
                     :name          => "remove-search-bar")

Deface::Override.new(:virtual_path     => "spree/shared/_header",
                     :insert_before    => "figure#logo",
                     :text             => "<%= image_tag('thin-bar-logo.svg', id: 'new-logo') %>",
                     :name             => "new-logo-svg")


Deface::Override.new(:virtual_path     => "spree/shared/_header",
                     :remove           => "figure#logo",
                     :name             => "remove-figure-logo")

Deface::Override.new(:virtual_path     => "spree/shared/_header",
                     :insert_bottom    => "#header",
                     :text             => "<div id='thin-black-line'></div>",
                     :name             => "black-line")

Deface::Override.new(:virtual_path  => "spree/shared/_header",
                     :remove        => "erb[loud]:contains('spree/shared/main_nav_bar')",
                     :name          => "remove-home-link")


Deface::Override.new(:virtual_path     => "spree/shared/_head",
                     :replace_contents => "title",
                     :text             => "Daniella Batlle",
                     :name             => "title")

Deface::Override.new(:virtual_path   => "spree/layouts/spree_application",
                     :insert_before  => "div.container",
                     :text           => "<div id='white-line'></div><div id='black-line'></div>",
                     :name           => "black-line-body")

Deface::Override.new(:virtual_path  => "spree/shared/_search",
                     :remove        => "erb[loud]:contains(':taxon')",
                     :name          => "remove-search-by-taxon")

Deface::Override.new(:virtual_path  => "spree/shared/_search",
                     :set_attributes => "erb[loud]:contains('submit_tag')",
                     :attributes    => { :class => 'btn btn-success search-button'},
                     :name          => "style-search-button" )




