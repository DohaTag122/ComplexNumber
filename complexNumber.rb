class ComplexNumber
    attr_accessor :real, :imagin
    @@hash_one = { "*" => 0, "+" => 0 }
    def initialize(r,i)
        @real=r
        @imagin=i       
    end

    
    def +(complexNumber)
        @@hash_one["+"]+=1
       # newCom = ComplexNumber.new
        myreal=@real + complexNumber.real
        myimagin= @imagin + complexNumber.imagin
        return ComplexNumber.new(myreal,myimagin)
    end

    def *(complexNumber)
        @@hash_one["*"]+=1
        myreal=@real*complexNumber.real - (@imagin*complexNumber.imagin)
        myimagin=(@real*complexNumber.imagin) + ( @imagin*complexNumber.real)
       return ComplexNumber.new(myreal,myimagin)
    end

    def self.bulk_add(arr)
        sum=ComplexNumber.new(0,0)
        arr.each do |i|
            @@hash_one["+"]+=1
            sum.real=i.real + sum.real
            sum.imagin= i.imagin + sum.imagin
        end
        return sum
    end
  
    def self.bulk_multiply(arr)
        total=ComplexNumber.new(1,1)
        arr.each do |i|
            @@hash_one["*"] +=1
            total.real=i.real*total.real - (i.imagin*total.imagin)
            total.imagin=(i.real*total.imagin) + ( i.imagin*total.real)
        end
        return total
    end


    def self.get_stats()

        @@hash_one.each do |key, value|
            puts "#{key}:#{value}"
        end

    end   
  
end

 num1=ComplexNumber.new(3,2)
 num2=ComplexNumber.new(1,7)
# num3=ComplexNumber.new(0,0)
# num3=num1 +num2
# puts "The Real Number#{num3.real}"
# puts "The Imagin Number #{num3.imagin}"
# num4=ComplexNumber.new(0,0)
# num4=num1 +num2
# puts "The Real Number#{num4.real}"
# puts "The Imagin Number #{num4.imagin}"
ary=[num1,num2]
num5=ComplexNumber.new(0,0)
num5= ComplexNumber.bulk_multiply(ary)
puts "The Real Number#{num5.real}"
puts "The Imagin Number #{num5.imagin}"

ComplexNumber.get_stats