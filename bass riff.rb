use_bpm 140

live_loop :bass do
  with_fx :gverb, room: 30, release: 4, mix: 0.4, amp: 0.3 do
    with_fx :distortion, distort: 0.8, mix: 0 do
      with_fx :wobble, phase: 7, cutoff_max: 80, cutoff_min: 40, mix: 1 do
        l = 3
        8.times do
          tick
          notle = ring(72,70,69,65,65,65,72,74,75,74,72,68,68,68,69,70).look
          synth :fm, note: notle-24, release: 0.35*l, depth: 5, amp: 3
          ##| synth :dsaw, note: notle-36, release: 0.35*l, detune: 0.3, amp: 9, cutoff: 105, env_curve: 7
          sleep ring(0.75,0.75,0.75,0.25,0.5,0.5,0.25,0.25).look*2
        end
      end
    end
  end
end

live_loop :beat do
  sample :bd_haus, amp: 3, cutoff: 85
  sleep 1
end

live_loop :shimmy do
  with_fx :gverb, room: 60, release: 4, mix: 0.4 do
    with_fx :slicer, phase: 0.25, mix: 0 do
      4.times do
        tick
        synth :zawa, note: ring(72,70,69,65,65,65,72,74,75,74,72,68,74,65,72,70).look+0, sustain: 8, release: 0, detune: 0.3, amp: 0.06
      end
      sleep 8
    end
  end
end