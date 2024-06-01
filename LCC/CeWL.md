[CeWL](https://github.com/digininja/CeWL) is another tool that can be used to create custom wordlists. It spiders and scrapes a website and creates a list of the words that are present. This kind of wordlist is effective, as people tend to use passwords associated with the content they write or operate on. For example, a blogger who blogs about nature, wildlife, etc. could have a password associated with those topics. This is due to human nature, as such passwords are also easy to remember. Organizations often have passwords associated with their branding and industry-specific vocabulary. For example, users of a networking company may have passwords consisting of words like `router`, `switch`, `server`, and so on. Such words can be found on their websites under blogs, testimonials, and product descriptions.

The general syntax of `CeWL` is as follows:

#### CeWL - Syntax

  Creating Custom Wordlists

```shell-session
Ubr@htb[/htb]$ cewl -d <depth to spider> -m <minimum word length> -w <output wordlist> <url of website>
```

CeWL can spider multiple pages present on a given website. The length of the outputted words can be altered using the "`-m`" parameter, depending on the password requirements (i.e., some websites have a minimum password length).

CeWL also supports the extraction of emails from websites with the "`-e`" option. It's helpful to get this information when phishing, password spraying, or brute-forcing passwords later.

#### CeWL - Example

  Creating Custom Wordlists

```shell-session
Ubr@htb[/htb]$ cewl -d 5 -m 8 -e http://inlanefreight.com/blog -w wordlist.txt
```

The command above scrapes up to a depth of five pages from "`http://inlanefreight.com/blog`", and includes only words greater than 8 in length.