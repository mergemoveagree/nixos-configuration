{ config
, ...
}: {
  services.easyeffects.enable = true;

  home.file."${config.xdg.configHome}/easyeffects/output/Loudness+Autogain.json".text = ''
    {
      "output": {
        "autogain#0": {
          "bypass": false,
          "input-gain": 0.0,
          "maximum-history": 15,
          "output-gain": 1.5,
          "reference": "Geometric Mean (MSI)",
          "silence-threshold": -70.0,
          "target": -12.0
        },
        "bass_enhancer#0": {
          "amount": 0.0,
          "blend": 3.0,
          "bypass": false,
          "floor": 20.0,
          "floor-active": true,
          "harmonics": 7.900000000000002,
          "input-gain": 0.0,
          "output-gain": 0.5,
          "scope": 100.0
        },
        "blocklist": [],
        "compressor#0": {
          "attack": 130.0,
          "boost-amount": 6.0,
          "boost-threshold": -60.0,
          "bypass": false,
          "dry": -100.0,
          "hpf-frequency": 10.0,
          "hpf-mode": "off",
          "input-gain": 0.0,
          "knee": -23.9,
          "lpf-frequency": 20000.0,
          "lpf-mode": "off",
          "makeup": 0.0,
          "mode": "Upward",
          "output-gain": 0.0,
          "ratio": 5.0,
          "release": 600.0,
          "release-threshold": -100.0,
          "sidechain": {
            "lookahead": 0.0,
            "mode": "RMS",
            "preamp": 0.0,
            "reactivity": 10.0,
            "source": "Middle",
            "type": "Feed-forward"
          },
          "threshold": -10.0,
          "wet": 0.0
        },
        "crossfeed#0": {
          "bypass": false,
          "fcut": 700,
          "feed": 4.5,
          "input-gain": 0.0,
          "output-gain": 0.0
        },
        "equalizer#0": {
          "balance": 0.0,
          "bypass": false,
          "input-gain": 0.0,
          "left": {
            "band0": {
              "frequency": 22.59,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band1": {
              "frequency": 28.44,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band10": {
              "frequency": 225.89,
              "gain": 4.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band11": {
              "frequency": 284.38,
              "gain": 4.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band12": {
              "frequency": 358.02,
              "gain": 4.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band13": {
              "frequency": 450.72,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band14": {
              "frequency": 567.42,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band15": {
              "frequency": 714.34,
              "gain": -1.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band16": {
              "frequency": 899.29,
              "gain": -2.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band17": {
              "frequency": 1132.15,
              "gain": -3.6,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band18": {
              "frequency": 1425.29,
              "gain": -2.5,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band19": {
              "frequency": 1794.33,
              "gain": -1.5,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band2": {
              "frequency": 35.8,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band20": {
              "frequency": 2258.93,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band21": {
              "frequency": 2843.82,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band22": {
              "frequency": 3580.16,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band23": {
              "frequency": 4507.15,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band24": {
              "frequency": 5674.16,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band25": {
              "frequency": 7143.35,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band26": {
              "frequency": 8992.94,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band27": {
              "frequency": 11321.45,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band28": {
              "frequency": 14252.86,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band29": {
              "frequency": 17943.28,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band3": {
              "frequency": 45.07,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band4": {
              "frequency": 56.74,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band5": {
              "frequency": 71.43,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band6": {
              "frequency": 89.93,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band7": {
              "frequency": 113.21,
              "gain": 4.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band8": {
              "frequency": 142.53,
              "gain": 4.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band9": {
              "frequency": 179.43,
              "gain": 4.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            }
          },
          "mode": "IIR",
          "num-bands": 30,
          "output-gain": 1.0,
          "pitch-left": 0.0,
          "pitch-right": 0.0,
          "right": {
            "band0": {
              "frequency": 22.59,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band1": {
              "frequency": 28.44,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band10": {
              "frequency": 225.89,
              "gain": 4.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band11": {
              "frequency": 284.38,
              "gain": 4.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band12": {
              "frequency": 358.02,
              "gain": 4.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band13": {
              "frequency": 450.72,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band14": {
              "frequency": 567.42,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band15": {
              "frequency": 714.34,
              "gain": -1.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band16": {
              "frequency": 899.29,
              "gain": -2.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band17": {
              "frequency": 1132.15,
              "gain": -3.6,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band18": {
              "frequency": 1425.29,
              "gain": -2.5,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band19": {
              "frequency": 1794.33,
              "gain": -1.5,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band2": {
              "frequency": 35.8,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band20": {
              "frequency": 2258.93,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band21": {
              "frequency": 2843.82,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band22": {
              "frequency": 3580.16,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band23": {
              "frequency": 4507.15,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band24": {
              "frequency": 5674.16,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band25": {
              "frequency": 7143.35,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band26": {
              "frequency": 8992.94,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band27": {
              "frequency": 11321.45,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band28": {
              "frequency": 14252.86,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band29": {
              "frequency": 17943.28,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band3": {
              "frequency": 45.07,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band4": {
              "frequency": 56.74,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band5": {
              "frequency": 71.43,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band6": {
              "frequency": 89.93,
              "gain": 0.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band7": {
              "frequency": 113.21,
              "gain": 4.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band8": {
              "frequency": 142.53,
              "gain": 4.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band9": {
              "frequency": 179.43,
              "gain": 4.0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 4.36,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            }
          },
          "split-channels": false
        },
        "loudness#0": {
          "bypass": false,
          "clipping": false,
          "clipping-range": 6.0,
          "fft": "4096",
          "input-gain": 0.0,
          "output-gain": 0.0,
          "std": "ISO226-2003",
          "volume": 4.000000000000002
        },
        "plugins_order": [
          "equalizer#0",
          "bass_enhancer#0",
          "loudness#0",
          "autogain#0",
          "compressor#0",
          "crossfeed#0"
        ]
      }
    }
  '';

  home.file."${config.xdg.configHome}/easyeffects/output/Perfect EQ.json".text = ''
    {
      "output": {
        "blocklist": [],
        "equalizer": {
          "input-gain": -2,
          "left": {
            "band0": {
              "frequency": 32,
              "gain": 4,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.504760237537245,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band1": {
              "frequency": 64,
              "gain": 2,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.5047602375372453,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band2": {
              "frequency": 125,
              "gain": 1,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.504760237537245,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band3": {
              "frequency": 250,
              "gain": 0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.504760237537245,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band4": {
              "frequency": 500,
              "gain": -1,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.5047602375372453,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band5": {
              "frequency": 1000,
              "gain": -2,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.504760237537245,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band6": {
              "frequency": 2000,
              "gain": 0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.5047602375372449,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band7": {
              "frequency": 4000,
              "gain": 2,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.5047602375372449,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band8": {
              "frequency": 8000,
              "gain": 3,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.5047602375372453,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band9": {
              "frequency": 16000,
              "gain": 3,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.504760237537245,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            }
          },
          "mode": "IIR",
          "num-bands": 10,
          "output-gain": 0,
          "right": {
            "band0": {
              "frequency": 32,
              "gain": 4,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.504760237537245,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band1": {
              "frequency": 64,
              "gain": 2,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.5047602375372453,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band2": {
              "frequency": 125,
              "gain": 1,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.504760237537245,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band3": {
              "frequency": 250,
              "gain": 0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.504760237537245,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band4": {
              "frequency": 500,
              "gain": -1,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.5047602375372453,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band5": {
              "frequency": 1000,
              "gain": -2,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.504760237537245,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band6": {
              "frequency": 2000,
              "gain": 0,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.5047602375372449,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band7": {
              "frequency": 4000,
              "gain": 2,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.5047602375372449,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band8": {
              "frequency": 8000,
              "gain": 3,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.5047602375372453,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            },
            "band9": {
              "frequency": 16000,
              "gain": 3,
              "mode": "RLC (BT)",
              "mute": false,
              "q": 1.504760237537245,
              "slope": "x1",
              "solo": false,
              "type": "Bell"
            }
          },
          "split-channels": false
        },
        "plugins_order": [
          "equalizer"
        ]
      }
    }
  '';
}
