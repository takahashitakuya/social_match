class Profile < ApplicationRecord
  belongs_to :user,:foreign_key => 'user_id',dependent: :destroy
 
  has_many :profile_terms
  has_many :term, through: :profile_terms
  
  has_many :relation, class_name: 'Relation', :foreign_key => 'profile_id'
  has_many :target_relation, class_name: 'Relation', :foreign_key => 'target_profile_id'  
  
  
  accepts_nested_attributes_for :profile_terms
  
  has_attached_file :profile_image, styles: { medium: "300x300>", thumb: "100x100>",:square => '100x100#',:card => '242x200#' }
  validates_attachment :profile_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  has_attached_file :cover_image,  styles: { medium: "300x300>", thumb: "100x100>",:square => '100x100#',:card => '242x200#' }
  validates_attachment :cover_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

## 自分がgoodかskipをしている場合
#  if profile.target_relation.where(profile_id: current_user.profile.id).size > 0

## 相手からgoodかskipされている場合
# if current_user.profile.target_relation(profile_id: profile.id).size >0

## 状態一覧
# 何も関連がない状態
# 自分がgoodをしている状態
# 自分がskipをしている状態
# 相手にgoodされている状態
# 相手にskipされている状態
# お互いにgoodしている状態
# お互いにskipしている状態
# 自分はgoodをしているが相手がskipしている状態
# 相手にgoodされているが自分はskipしている状態


  def is_reration(prof_id)
    target_relation.where(profile_id: prof_id).size    
  end
  
  def self_relation_status(prof_id)
    #自分から相手に送ったリアクション
    if target_relation.where(profile_id: prof_id).size > 0
      target_relation.where(profile_id: prof_id)[0].status
    end
  end
  
  def second_relation_status(prof_id)
    if relation.where(target_profile_id: prof_id).size > 0
      relation.where(target_profile_id: prof_id)[0].status
    end
  end
  
  
end
