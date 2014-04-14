require 'spec_helper'

describe Comment do
  describe :validations do
    before { subject.valid? }

    it { expect(subject.errors[:video_id]).to include "can't be blank" }
    it { expect(subject.errors[:user    ]).to include "can't be blank" }
    it { expect(subject.errors[:text    ]).to include "can't be blank" }
  end
end
