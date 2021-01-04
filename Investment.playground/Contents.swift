import UIKit
var deposite : Double = 550990
var percent:Double = 5
var endOfContribution : Double
endOfContribution = deposite*(1+0.01*percent)
endOfContribution = endOfContribution*(1+0.01*percent)
endOfContribution = endOfContribution*(1+0.01*percent)
endOfContribution = endOfContribution*(1+0.01*percent)
endOfContribution = endOfContribution*(1+0.01*percent)
print("Answer: \(Int(endOfContribution))")
