require "ruby_novice/version"
require 'thor'

=begin
def my_hello
# bundle exec rspec spec/ruby_novice_spec.rb:18でテストできます．
  print "Hello.\n"
end
=end

def my_helloruby
# bundle exec rspec spec/ruby_novice_spec.rb:25でテストできます. 
  print("Hello, Ruby.\n")
end

def my_puts_and_p
# bundle exec rspec spec/ruby_novice_spec.rb:32でテストできます.
  puts "Hello,\n\tRuby."
  p "Hello,\n\tRuby."
end

def my_kiritsubo
# bundle exec rspec spec/ruby_novice_spec.rb:40でテストできます. 
  print "いづれの御時にか女御更衣あまたさぶらいたまいけるなかに\n"
  print "いとやむごとなき際にはあらぬがすぐれて時めきたまふありけり\n"
end

def my_area_volume
# bundle exec rspec spec/ruby_novice_spec.rb:48でテストできます. 
  x = 10
  y = 20
  z = 30
  area = (x*y + y*z + z*x) * 2
  volume = x * y * z
  print "表面積=", area, "\n"
  print "体積=", volume, "\n"
end

def my_comment_sample
# bundle exec rspec spec/ruby_novice_spec.rb:56でテストできます. 
=begin
  「たのしいRuby 第５版」サンプル
   コメントの使い方の例
 　2006/06/16 作成
　 2006/07/01 一部コメントを追加
   2015/10/01 第５版用に更新
=end

  x = 10 # 縦
  y = 20 # 縦
  z = 30 # 高さ
  # 表面積と体積を計算する
  area = (x*y + y*z + z*x) * 2
  volume = x * y * z
  # 出力する
  print "表面積=", area, "\n"
  print "体積=", volume, "\n"
end

def my_greater_smaller
# bundle exec rspec spec/ruby_novice_spec.rb:64でテストできます. 
  a = 20
  if a >= 10 then
    print "greater\n"
  end
  if a <= 9 then
    print "smaller\n"
  end
end

def my_greater_smaller_else
# bundle exec rspec spec/ruby_novice_spec.rb:72でテストできます. 
  a = 20
  if a >= 10
    print "greater\n"
  else
    print "smaller\n"
  end
end

def my_print_argv(argv)
  puts "最初の引数: #{argv[0]}"
  puts "２番目の引数: #{argv[1]}"
  puts "３番目の引数: #{argv[2]}"
  puts "４番目の引数: #{argv[3]}"
  puts "５番目の引数: #{argv[4]}"
end

def my_happy_birth(argv)
  name = argv[0]
  print "Happy Birthday, ", name, "!\n"
end

def my_arg_arith(argv)
  num0 = argv[0].to_i
  num1 = argv[1].to_i
  puts "#{num0} + #{num1} = #{num0 + num1}"
  puts "#{num0} - #{num1} = #{num0 - num1}"
  puts "#{num0} * #{num1} = #{num0 * num1}"
  puts "#{num0} / #{num1} = #{num0 / num1}"
end

def my_read_text(argv)
  filename = argv[0]
  file = File.open(filename) # ①
  text = file.read           # ②
  print text                 # ③
  file.close                 # ④
end

def my_read_text_simple(argv)
  filename = argv[0]
  text = File.read(filename)
  print text
end

def my_read_text_oneline(argv)
  print File.read(argv[0])
end

def my_read_line(argv)
  filename = argv[0]
  file = File.open(filename)
  file.each_line do |line|
    print line
  end
  file.close
end

def my_simple_grep(argv)
  pattern = Regexp.new(argv[0])
  filename = argv[1]

  file = File.open(filename)
  file.each_line do |line|
    if pattern =~ line
      print line
    end
  end
file.close
end

def my_hello_ruby2
  def hello
    puts "Hello, Ruby."
  end

  hello()
end

module RubyNovice
  # Your code goes here...

  class CLI < Thor
#    class_option :help, type: :boolean, aliases: '-h', desc: 'help.'
#    class_option :debug, type: :boolean, aliases: '-d', desc: 'debug mode'

=begin
    desc 'hello', 'print hello'
    def hello
      my_hello
    end
=end

    desc 'helloruby', 'print helloruby'
    def helloruby
      my_helloruby
    end

    desc 'puts_and_p', 'print puts_and_p'
    def puts_and_p
      my_puts_and_p
    end

    desc 'kiritsubo', 'print kiritsubo'
    def kiritsubo
      my_kiritsubo
    end
   
    desc 'area_volume', 'print area_volume'
    def area_volume
      my_area_volume
    end

    desc 'comment_sample', 'print comment_sample'
    def comment_sample
      my_comment_sample
    end

    desc 'greater_smaller', 'print greater_smaller'
    def greater_smaller
      my_greater_smaller
    end

    desc 'greater_smaller_else', 'print greater_smaller_else'
    def greater_smaller_else
      my_greater_smaller_else
    end

    desc 'print_argv ARG1 ARG2 ARG3 ARG4 ARG5', 'print print_argv ARG1 ARG2 ARG3 ARG4 ARG5'
    def print_argv(argv1, argv2, argv3, argv4, argv5)
      argv=[argv1, argv2, argv3, argv4, argv5]
      my_print_argv(argv)
    end

    desc 'happy_birth ARG1', 'print happy_birth ARG1'
    def happy_birth(argv1)
      argv=[argv1]
      my_happy_birth(argv)
    end

    desc 'arg_arith ARG1 ARG2', 'print arg_arith ARG1 ARG2'
    def arg_arith(argv1, argv2)
      argv=[argv1, argv2]
      my_arg_arith(argv)
    end

    desc 'read_text ARG1', 'print read_text ARG1'
    def read_text(argv1)
      Dir::chdir("../")
      argv1 = "#{Dir::pwd}/#{argv1}"
      argv=[argv1]
      my_read_text(argv)
    end

    desc 'read_text_simple ARG1', 'print read_text_simple ARG1'
    def read_text_simple(argv1)
      Dir::chdir("../")
      argv1 = "#{Dir::pwd}/#{argv1}"
      argv=[argv1]
      my_read_text_simple(argv)
    end

    desc 'read_text_oneline ARG1', 'print read_text_oneline ARG1'
    def read_text_oneline(argv1)
      Dir::chdir("../")
      argv1 = "#{Dir::pwd}/#{argv1}"
      argv=[argv1]
      my_read_text_oneline(argv)
    end

    desc 'read_line ARG1', 'print read_line ARG1'
    def read_line(argv1)
      Dir::chdir("../")
      argv1 = "#{Dir::pwd}/#{argv1}"
      argv=[argv1]
      my_read_line(argv)
    end

# bundle exec rspec spec/ruby_novice_spec.rb:138でテストできます．            
    desc 'simple_grep ARG1 ARG2', 'print simple_grep ARG1 ARG2'
    def simple_grep(argv1,argv2)
      Dir::chdir("../")
      argv2 = "#{Dir::pwd}/#{argv2}"
      argv1 = "#{Dir::pwd}/#{argv2}/#{argv1}"
      argv=[argv1,argv2]
      my_simple_grep(argv)
    end

    desc 'hello_ruby2', 'print hello_ruby2'
    def hello_ruby2
      my_hello_ruby2
    end



    desc 'version', 'version'
    def version
      puts RubyNovice::VERSION
    end

    private

    def output_error_if_debug_mode(e)
      return unless options[:debug]
      STDERR.puts(e.message)
      STDERR.puts(e.backtrace)
    end
  end
end

