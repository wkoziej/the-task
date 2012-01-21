# -*- coding: utf-8 -*-
class PopulateData < ActiveRecord::Migration
  def up


    role = Role.new
    role.name = "admin"
    role.save

    user = User.new
    user.login = 'test'
    user.email = 'aaa@bbb.com'
    user.password = "aaabbb"
    user.roles << role
    user.save()

    point_kind = PointKind.new
    point_kind.name = 'PUBLIC'
    point_kind.save ()

    point_kind = PointKind.new
    point_kind.name = 'SPONSORED_BY_A'
    point_kind.save ()

    mark = Mark.new
    mark.user = User.find (1)
    mark.point_kind = PointKind.find(1)
    mark.point_sum = 110
    mark.save()

    mark = Mark.new
    mark.user = User.find (1)
    mark.point_kind = PointKind.find(2)
    mark.point_sum = 10
    mark.save()


    game = Game.new
    game.creator = User.find(1)
    game.title = 'Pobierz kota!'
    game.description = 'Zbioeraj kotki, czyli bazie.'
    game.image = File.open("./public/game-over.gif", "rb")

    game.save()


    game = Game.new
    game.creator = User.find(1)
    game.title = 'Rzuć się na kości!'
    game.description = 'Poruszająca do szpiku kości gra losowa.'
    game.image = File.open("./public/P_game.jpg", "rb")

    game.save()


    challenge = CaptureCode.new
    challenge.game = Game.find(1)
    challenge.points = 5
    challenge.title = "Złap bazie w barze"
    challenge.point_kind = PointKind.find(1)
    challenge.description = "Poproś bara mana"
    if not challenge.save()
      say "Errors during save" 
      challenge.errors.each do |attribute, errors_array|
        say attribute
        say errors_array
      end
    end
    challenge = EnterMessage.new
    challenge.game = Game.find(1)
    challenge.points = 10
    challenge.point_kind = PointKind.find(2)
    challenge.title = "Zabaw się w kotka"
    challenge.description = "I złap za myszkę aby..."
    challenge.save()

    
    reward = Reward.new
    reward.price_in_points = 13
    reward.point_kind = PointKind.find(:first)
    reward.user_limit = 2
    reward.description = "Darmowa szklanka wody"
    reward.sponsor = User.find(:first) 
    reward.creator = User.find(:first)
    reward.image = File.open("./public/reward1.jpg", "rb")
    
    if not reward.save
      logger.error reward.errors.full_messages
    end

    reward = Reward.new
    reward.price_in_points = 25
    reward.point_kind = PointKind.find(:first)
    reward.expiration_date = "2011-12-08 07:59:43"
    reward.description = "2 złote na loda"
    reward.sponsor = User.find(:first) 
    reward.creator = User.find(:first)
    reward.image = File.open("./public/reward2.jpg", "rb")

    if not reward.save
      logger.error  reward.errors.full_messages
    end


    reward = Reward.new
    reward.price_in_points = 1125
    reward.point_kind = PointKind.find(:first)
    reward.expiration_date = "2011-12-08 07:59:43"
    reward.description = "Czego chcieć więcej"
    reward.sponsor = User.find(:first) 
    reward.creator = User.find(:first)
    reward.image = File.open("./public/reward3.jpg", "rb")

    if not reward.save
      logger.error  reward.errors.full_messages
    end
    
  end

  def down
  end
end
