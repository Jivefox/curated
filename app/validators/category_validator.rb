# class CategoryValidator < ActiveModel::Validator
#     def validate(product)
#         binding.pry
#         categories, category_ids = product.categories, product.category_ids
#         if !categories.empty? || !category_ids.empty?
#             errors.add(:categories, message: "must not be empty") unless !categories.empty?
#             errors.add(:category_ids, message: "must not be empty") unless !category_ids.empty?
#         end
#     end
# end