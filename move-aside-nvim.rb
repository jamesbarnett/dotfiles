#!/usr/bin/env ruby

require "fileutils"

def nvim_dir
  @nvim_dir ||= File.join "#{ENV["HOME"]}", ".config", "nvim"
end

def nice_now
  Time.now.strftime "%Y-%m-%d"
end

def backup_suffix
  @unique_suffix ||= ".bak#{nice_now}_#{rand 1000}"
end

def backup_nvim
  @backup ||= "#{nvim_dir}#{backup_suffix}"

  puts "Backing up #{nvim_dir} to #{@backup}"
  FileUtils.mv nvim_dir, @backup
end

def extra_dir name
  @extra_path ||= {}
  @extra_path[name] ||= File.join "#{ENV["HOME"]}", ".local", name, "nvim"
end

def backup_nvim_extra
  ["share", "state"].each do |name|
    dir = extra_dir name
    backup_dir = "#{dir}#{backup_suffix}"
    puts "Backing up #{dir} to #{backup_dir}"
    FileUtils.mv dir, backup_dir
  end
end

if __FILE__ == $0
  backup_nvim
  backup_nvim_extra
end

