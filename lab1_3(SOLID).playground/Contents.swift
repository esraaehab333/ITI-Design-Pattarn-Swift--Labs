protocol GestureProtocol { //  this make a lot of things
    func didTap()
    func didDoubleTap()
    func didLongPress()
}
// now it inherite from the protocal so
// i think it SP or IS
// i think if i take the refrance it will be easy
class SuperButton{
    private let gester: GestureProtocol
    init(gester:GestureProtocol){
        self.gester = gester
    }
    func DoubleTap(){
        gester.didDoubleTap()
    }
    func Tap(){
        gester.didTap()
    }
    func LongTap(){
        gester.didLongPress()
    }
}

class PoorButton{
    private let gester: GestureProtocol
    init(gester:GestureProtocol){
        self.gester = gester
    }
    func Tap(){
        gester.didTap()
    }
}
// may it be as a IS
protocol TapGesture {
    func didTap()
}

protocol DoubleTapGesture {
    func didDoubleTap()
}

protocol LongPressGesture {
    func didLongPress()
}
class SuperButton1: TapGesture, DoubleTapGesture, LongPressGesture {
    func didTap() {}
    func didDoubleTap() {}
    func didLongPress() {}
}
class PoorButton1: TapGesture {
    func didTap() {}
}
