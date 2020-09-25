1. Add categories and products_categories model for association
    - add category_ids to products_params
    - add checkbox options in products new form
    - add new category action in Category controller
    - make the field to create new category in products#new form only accessible to admin
    - add edit_product_path(@product) to show and index page (later to be protected by admin authorization)

2. Change products index page to have dynamic <h1> if it is for all products or products within a category.

Change create action for products to set seller_id upon creation
Change edit action for products to set buyer_id when "sold"


Show sold products in index?

Set up authorization if current_user.admin || current_user.id == seller.id (that's now quite right because those integers won't be the same, but need to add checks so that either admin or the seller only have access to those actions) only in edit/update/delete actions

Add approval option to admin show page and also show all products pending approval in index page if current_user.admin



