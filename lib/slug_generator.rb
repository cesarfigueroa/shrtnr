class SlugGenerator
  def initialize(id)
    @id = id
  end

  CHARSET = %w(A B C D E F G H I J K M N P Q R S T U V W X Y Z a b c d e f g h j k m n p q r s t u v w x y z 2 3 4 5 6 7 8 9).freeze

  def generate
    chars = []

    while @id > 0
      char = CHARSET[@id % CHARSET.length]
      chars.unshift(char)
      @id /= CHARSET.length
    end

    chars.join
  end
end
