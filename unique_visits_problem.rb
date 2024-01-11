
# Let’s say we have a website and we keep track of what pages customers are viewing, for things like business metrics.

# Every time somebody comes to the website, we write a record to a log file consisting of Timestamp, PageId, CustomerId. At the end of the day we have a big log file with many entries in that format. And for every day we have a new file.

# Now, given two log files (log file from day 1 and log file from day 2) we want to generate a list of ‘loyal customers’ that meet the criteria of: (a) they came on both days, and (b) they visited at least two unique pages.

# Given 2 unique pages overall, not per day

def parse_log(file_path)
  log_entries = []

  File.foreach(file_path) do |line|
    timestamp, page_id, customer_id = line.split.map(&:strip)
    log_entries << { timestamp: timestamp, page_id: page_id, customer_id: customer_id }
  end

  log_entries
end

def find_loyal_customers(log_file1, log_file2)
  entries_day1 = parse_log(log_file1)
  entries_day2 = parse_log(log_file2)

  customers_day1 = entries_day1.map { |entry| entry[:customer_id] }.uniq
  loyal_customers = []

  customers_day1.each do |customer_id|
    pages_day1 = entries_day1.select { |entry| entry[:customer_id] == customer_id }.map { |entry| entry[:page_id] }.uniq
    pages_day2 = entries_day2.select { |entry| entry[:customer_id] == customer_id }.map { |entry| entry[:page_id] }.uniq

    # common_pages = pages_day1 & pages_day2 # intersection

    unique_pages = pages_day1 | pages_day2 # union (distinct pages)


    if unique_pages.length >= 2
      loyal_customers << customer_id
    end
  end

  loyal_customers
end

# Replace 'day1.log' and 'day2.log' with your actual log file paths
loyal_customers = find_loyal_customers('day1.log', 'day2.log')

puts "Loyal Customers: #{loyal_customers}"


# We can do better
# We need to reduce memory footprint of parse_file method. 
# Duplicates can arise from customer_id or page_id

def parse_file(file_path)
  entries = []
  seen_entries = Set.new

  File.readlines(file_path).each do |line|
    timestamp, page_id, customer_id = line.split
    entry = { timestamp: timestamp, page_id: page_id.to_i, customer_id: customer_id.to_i }

    unique_key = [entry[:page_id], entry[:customer_id]]

    unless seen_entries.include?(unique_key)
      entries << entry
      seen_entries << unique_key
    end
  end

  entries
end


require 'set'

def loyal_customers(log_file_path_day1, log_file_path_day2)
  log_day1 = parse_file(log_file_path_day1)
  log_day2 = parse_file(log_file_path_day2)

  customer_pages = Hash.new { |hash, key| hash[key] = Set.new }

  # Process log_day1
  log_day1.each do |entry|
    customer_id = entry[:customer_id]
    page_id = entry[:page_id]

    customer_pages[customer_id].add(page_id)
  end

  # Process log_day2
  loyal_customers = Set.new
  log_day2.each do |entry|
    customer_id = entry[:customer_id]
    page_id = entry[:page_id]

    # check if customer came day 1
    if customer_pages.key?(customer_id)
      customer_pages[customer_id].add(page_id)

      # If the customer has at least two unique pages, mark as common customer
      loyal_customers.add(customer_id) if customer_pages[customer_id].size >= 2
    end
  end

  loyal_customers.to_a
end

# Example Usage
log_file_path_day1 = 'path/to/log/day1.txt'
log_file_path_day2 = 'path/to/log/day2.txt'

puts loyal_customers(log_file_path_day1, log_file_path_day2)
