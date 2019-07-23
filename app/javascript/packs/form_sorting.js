import Sortable from 'sortablejs';

function initSortable() {
  const resumeBlocks = document.getElementById('resume-blocks-fields');
  if (resumeBlocks) {
    var sortable = Sortable.create(resumeBlocks, {
      handle: '.handle',
      animation: 250,
      fallbackOnBody: true,
      invertSwap: true,
      swapThreshold: 0.4,
      onSort: (event) => {
        const positions = document.querySelectorAll('.artist_resume_blocks_position');
        let count = 1;
        positions.forEach((position) => {
          const input = position.querySelector('input');
          input.value = count;
          count += 1;
        });
      }
    });
  }

  const resumeItems = document.querySelectorAll('.resume-items-fields');
  if (resumeItems) {
    resumeItems.forEach((item) => {
      var sortable = Sortable.create(item, {
        animation: 250,
        fallbackOnBody: true,
        invertSwap: true,
        swapThreshold: 0.4,
        dragClass: 'nested-fields',
        onSort: (event) => {
          const parent = event.item.closest('.resume-items-fields');
          const positions = parent.querySelectorAll('.artist_resume_blocks_resume_items_position');
          let count = 1;
          positions.forEach((position) => {
            const input = position.querySelector('input');
            input.value = count;
            count += 1;
          });
        }
      });
    });
  }

  const photos = document.querySelectorAll('.photo-fields');
  if (photos) {
    photos.forEach((item) => {
      var sortable = Sortable.create(item, {
        animation: 250,
        fallbackOnBody: true,
        invertSwap: true,
        swapThreshold: 0.4,
        dragClass: 'nested-fields',
        onSort: (event) => {
          const parent = event.item.closest('.photo-fields');
          const positions = parent.querySelectorAll('.artwork_photos_position');
          let count = 1;
          positions.forEach((position) => {
            const input = position.querySelector('input');
            input.value = count;
            count += 1;
          });
        }
      });
    });
  }

  const videos = document.querySelectorAll('.video-fields');
  if (videos) {
    videos.forEach((item) => {
      var sortable = Sortable.create(item, {
        animation: 250,
        fallbackOnBody: true,
        invertSwap: true,
        swapThreshold: 0.4,
        dragClass: 'nested-fields',
        onSort: (event) => {
          const parent = event.item.closest('.video-fields');
          const positions = parent.querySelectorAll('.artwork_videos_position');
          let count = 1;
          positions.forEach((position) => {
            const input = position.querySelector('input');
            input.value = count;
            count += 1;
          });
        }
      });
    });
  }
}

export default initSortable;
