class RelationsController < ApplicationController
  before_action:set_relation
  def new
  end
  def create
    # 過去に同じ相手とのリレーションがあった場合は削除
    old_relation = Relation.where('profile_id':params['relation']['profile_id'],'target_profile_id':params['relation']['target_profile_id'])
    if old_relation.size > 0
      old_relation.destroy
    end
  
    relation = Relation.new
    relation.profile_id = params['relation']['profile_id']
    relation.target_profile_id = params['relation']['target_profile_id']
    relation.status = params['relation']['status']
    relation.save
  
    result = {'params' => params}
    render :json => result

  end
  def destroy
    relation = Relation.where('profile_id':params['relation']['profile_id'],'target_profile_id':params['relation']['target_profile_id'])
    relation[0].destroy
     result = {'params' => params}
    render :json => result   
  end
  
  private
    def relation_params
    params.require(:profile).permit(:profile_id,:target_id,:status)
  end
  def set_relation
    
  end
end
