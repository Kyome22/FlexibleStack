/*
 ContentView.swift
 FlexibleStackSample

 Created by Takuto Nakamura on 2023/12/01.
*/

import SwiftUI
import FlexibleStack

struct ContentView: View {
    @State var ratio: CGFloat = 1.0
    @State var count: Int = 4
    @State var alignment: BoxAlignment = .center

    var array: [Item] {
        (0 ..< count).map { i in
            switch i % 4 {
            case 0: Item(value: "📘", color: .blue)
            case 1: Item(value: "📕", color: .red)
            case 2: Item(value: "📗", color: .green)
            case 3: Item(value: "📙", color: .orange)
            default: fatalError()
            }
        }
    }

    var body: some View {
        VStack {
            Spacer()
            FlexibleVStack(alignment: alignment) {
                ForEach(array) { item in
                    Text(item.value)
                        .font(.system(size: 200))
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1.0, contentMode: .fit)
                        .border(item.color)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(ratio, contentMode: .fit)
            .border(Color.gray)
            Spacer()
            HStack {
                Text("Aspect Ratio:")
                Slider(value: $ratio, in: 0.1 ... 4.0, step: 0.1)
                Text(String(format: "%0.1lf", ratio))
            }
            HStack {
                Text("Item Count:")
                Slider(
                    value: Binding<Double>(
                        get: { Double(count) },
                        set: { count = Int($0.rounded()) }
                    ),
                    in: 1.0 ... 12.0,
                    step: 1.0
                )
                Text("\(count)")
            }
            HStack {
                Text("Alignment:")
                Picker(selection: $alignment) {
                    ForEach(BoxAlignment.allCases) { alignment in
                        Text(alignment.label)
                            .tag(alignment)
                    }
                } label: {
                    EmptyView()
                }
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
