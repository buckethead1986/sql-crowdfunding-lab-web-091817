# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
"SELECT projects.title, SUM(pledges.amount)
FROM projects INNER JOIN pledges 
ON projects.id = pledges.project_id 
GROUP BY projects.id
ORDER BY projects.title"
# selects the projects title columnm and the sum of the pledges for that column ('group by projects.id') from the projects table joined with the pledges table, that join defined by 
# where projects.id and pledges.project_id are the same. Group the results according to projects.id (without this, the SUM(pledges.amount) sums ALL pledges together, not just 
# per project) and then order ther results by title.
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
"SELECT users.name, users.age, SUM(pledges.amount)
FROM users INNER JOIN pledges
ON users.id = pledges.user_id
GROUP BY users.id
ORDER BY users.name"
# selects users.name, users.age, and the sum of pledges for that user (defined by group by isers.id) from the users table and pledges table, joined where users.id and
# pledges.user_id are the same, grouped by users.id (to make the sum per user, not a grand total), and ordered by users.name (alphabetical is default)
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
"SELECT projects.title, SUM(pledges.amount) - projects.funding_goal
FROM projects INNER JOIN pledges
ON projects.id = pledges.project_id
GROUP BY projects.id
HAVING SUM(pledges.amount) >= projects.funding_goal"
# Selects project title column, and Sums pledges amounts (grouped by project.id), minus the funding goal (math can be done in selects!) from the projects table and the pledges 
# table, where projects.id and pledges project_id match, group by projects.id to make the sum per project, and not totaling everything, use 'having' not where, because its an
# aggregate (sum, count, avg, etc), finding the projects.title where the pledges exceeded the goal.
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
"SELECT users.name, SUM(pledges.amount)
FROM users INNER JOIN pledges
ON users.id = pledges.user_id
GROUP BY users.name
ORDER BY SUM(pledges.amount) 
" 
# Selects users.name and the sum of pledge amounts (again, grouped by user.name so the sum is per user, not summing everything), from the users table, joined to the pldges table,
# where uers.id matchesthe pledges.user_id, group by user.name for the sum function, and then order by pledge sum, defaulting to ascending.
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
"SELECT projects.category, pledges.amount
FROM projects INNER JOIN pledges
ON projects.id = pledges.project_id
WHERE projects.category = 'music' "
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
"SELECT projects.category, SUM(pledges.amount)
FROM projects INNER JOIN pledges
ON projects.id = pledges.project_id
WHERE projects.category = 'books' "
#in this case, you DO want the grand total sum of all pledges where the project.category = '
# books', so no need to 'group by' anything.
end
