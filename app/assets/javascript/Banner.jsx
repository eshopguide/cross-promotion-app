import { useLocale } from "@shopify/app-bridge-react";
import {
  Box,
  Layout,
  MediaCard,
  Text,
  VideoThumbnail,
  Modal,
} from "@shopify/polaris";
import { useEffect, useState } from "react";
import { useTranslation } from "react-i18next";

const sessionStorageKey = "crossPromotionBanner";

export default () => {
  const locale = useLocale();
  const { t } = useTranslation();
  const [dismissed, setDismissed] = useState(false);
  const [promotion, setPromotion] = useState();
  const language = (locale || "").slice(0, 2).toLowerCase() || "de";
  const [showVideoModal, setShowVideoModal] = useState(false);

  // Fetch current active banner via API
  useEffect(() => {
    try {
      const dismissedSessionStorage = sessionStorage.getItem(sessionStorageKey);
      setDismissed(dismissedSessionStorage === "dismissed");
    } catch {}

    (async () => {
      const response = await fetch("/cross_promotion_app/api/banner");
      const responseBody = await response.json();

      setPromotion(responseBody);
    })();
  }, []);

  const onDismiss = () => {
    try {
      sessionStorage.setItem(sessionStorageKey, "dismissed");
    } catch {}

    setDismissed(true);
  };

  if (!dismissed && promotion) {
    return (
      <>
        <VideoModal
          showVideoModal={showVideoModal}
          videoId={promotion.video_id}
          onClose={() => setShowVideoModal(false)}
        />
        <Layout.Section>
          <Box paddingInlineStart={{ xs: "4", sm: "0" }}>
            <Text variant="headingMd" as="h2">
              {t("home.promotion.title")}
            </Text>
          </Box>
        </Layout.Section>
        <Layout.Section>
          <MediaCard
            title={promotion[`title_${language}`]}
            primaryAction={{
              content: promotion[`cta_text_${language}`],
              url: promotion.cta_url,
            }}
            secondaryAction={
              promotion.link && {
                content: promotion[`link_text_${language}`],
                url: promotion.link,
              }
            }
            description={promotion[`text_${language}`]}
            popoverActions={[
              { content: t("home.promotion.dismiss"), onAction: onDismiss },
            ]}
          >
            {promotion.video_id && (
              <VideoThumbnail
                videoLength={promotion.video_length}
                thumbnailUrl={promotion.image_url}
                onClick={() => setShowVideoModal(true)}
              />
            )}
            {!promotion.video_id && promotion.image_url && (
              <img
                alt=""
                width="100%"
                height="100%"
                style={{
                  objectFit: "cover",
                  objectPosition: "center",
                }}
                src={promotion.image_url}
              />
            )}
          </MediaCard>
        </Layout.Section>
      </>
    );
  }

  return [];
};

const VideoModal = ({ showVideoModal, videoId, onClose }) => {
  return (
    <Modal open={showVideoModal} onClose={onClose}>
      <Modal.Section>
        <iframe
          frameBorder="0"
          scrolling="no"
          marginHeight="0"
          marginWidth="0"
          width="100%"
          height="350"
          type="text/html"
          src={`https://www.youtube.com/embed/${videoId}`}
        ></iframe>
      </Modal.Section>
    </Modal>
  );
};
