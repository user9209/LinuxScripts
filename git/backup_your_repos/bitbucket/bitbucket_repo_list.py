import requests
# pip3 install requests

##Login
username = '<your username>'
# Password using App-PW if 2FA is enabled: https://bitbucket.org/account/settings/app-passwords/
password = '<your app password>'
team = '<the team or your username>'

full_repo_list = []

# Request 100 repositories per page (and only their slugs), and the next page URL
next_page_url = 'https://api.bitbucket.org/2.0/repositories/%s?pagelen=100&fields=next,values.links' % team

# Keep fetching pages while there's a page to fetch
while next_page_url is not None:
  response = requests.get(next_page_url, auth=(username, password))
  page_json = response.json()

  # Parse repositories from the JSON
  for repo in page_json['values']:
    full_repo_list.append(repo['links']['clone'][1]['href'])

  # Get the next page URL, if present
  # It will include same query parameters, so no need to append them again
  next_page_url = page_json.get('next', None)

# Result length will be equal to `size` returned on any page
print ("Result:", len(full_repo_list))


for repo in full_repo_list:
  print(repo)
