import SwiftUI

struct TimerView: View {
    @StateObject var viewModel = TimerViewModel()
    var body: some View {
        VStack{
              switch viewModel.state {
              case .settings:
                  SettingsView(viewModel: viewModel)
              case .start(let workSession):
                  Counter(viewModel: viewModel,
                          timeRemaing: workSession.timerConfig.mainTime,
                          goTo: { time, isCompleted in viewModel.pause(time: time, isCompleted: isCompleted) })
              case .shortPause(let workSession):
                  Counter(viewModel: viewModel,
                          timeRemaing: workSession.timerConfig.shortBreakTime,
                          goTo: { time, isCompleted in viewModel.start(time: time, isCompleted: isCompleted) })
              case .longPause(let workSession):
                  Counter(viewModel: viewModel,
                          timeRemaing: workSession.timerConfig.longBreakTime,
                          goTo: { time, isCompleted in viewModel.finish(time: time) })
              case .finish(let workSession):
                  FinishView(viewModel: viewModel, workSession: workSession)
              }
          }
    }
}

