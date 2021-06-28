# crum "ページ名" do
#   link "ビューに表示される名前", "リンクされるURL"
#   parent :親のページ名(現在の前のページ)
# end


crumb :root do
  link '<i class="fas fa-home"></i>Top'.html_safe, root_path
end

crumb :time_table_new do
  link "タイムテーブル作成", new_time_table_path
  parent :root
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
