Pod::Spec.new do |s|

#名称pod install 和 search 时要用到
s.name         = "JDPopupAnimationView"

#版本号
s.version      = "1.0.3"

#简介
s.summary      = "轻量级的弹窗动画。"

#详细介绍,必填
s.description  = <<-DESC
轻量级弹窗动画，有渐入、上弹，下降、左移入。右移入等效果。
DESC

#主页地址，填个可以访问的地址就行
s.homepage     = "https://github.com/Jedediah-S/JDPopupAnimationView.git"

#开源协议
s.license      = { :type => 'MIT', :file => 'LICENSE' }

#作者信息
s.author       = { 'Jedediah' => '13432414304@163.com' }

#支持平台及版本
s.platform     = :ios, "9.0"

#项目代码库地址，仅支持http、https。ssh验证不通过
s.source       = { :git => "https://github.com/Jedediah-S/JDPopupAnimationView.git", :tag => "#{s.version}" }

#代码源文件地址,**/* 表示Classes目录及其子目录下所有文件
s.source_files  = 'JDPopupAnimationView/Classes/**/*'

#所需的framework，多个用逗号隔开
s.framework  = "UIKit"

#是否使用ARC
s.requires_arc = true

end
