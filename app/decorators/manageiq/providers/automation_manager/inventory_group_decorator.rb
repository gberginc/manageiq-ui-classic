class ManageIQ::Providers::AutomationManager::InventoryGroupDecorator < Draper::Decorator
  delegate_all

  def fonticon
    'pficon pficon-folder-close'.freeze
  end

  def listicon_image
    '100/inventory_group.png'
  end
end
